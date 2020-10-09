module("luci.controller.serial", package.seeall)

function index()
        entry({"admin", "services", "serial"}, cbi("serial"), _("serial"), 1)
        end
