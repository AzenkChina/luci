module("luci.controller.serial", package.seeall)

function index()
	entry({"admin", "services", "serial"}, cbi("serial"), _("Serial"), 1)
end
