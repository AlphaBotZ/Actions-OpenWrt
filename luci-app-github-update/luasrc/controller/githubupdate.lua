module("luci.controller.githubupdate", package.seeall)

function index()
    entry({"admin", "system", "githubupdate"}, template("githubupdate"), _("固件更新"), 90).dependent = true
    entry({"admin", "system", "githubupdate", "upgrade"}, call("action_upgrade"), nil).leaf = true
end

function action_upgrade()
    local sys = require "luci.sys"
    local url = sys.exec("/usr/bin/check_update.sh url")
    local sha256 = sys.exec("/usr/bin/check_update.sh sha256")

    if url and #url > 0 then
        sys.exec("wget -O /tmp/latest.bin " .. url)
        local calc = sys.exec("sha256sum /tmp/latest.bin | awk '{print $1}'")

        if calc == sha256 then
            sys.exec("sysupgrade /tmp/latest.bin &")
            luci.http.write("校验通过，升级任务已启动。")
        else
            luci.http.write("校验失败，固件可能损坏或不匹配。")
        end
    else
        luci.http.write("未找到可用的升级文件。")
    end
end
