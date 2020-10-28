-- Licensed to the public under the Apache License 2.0.

module("luci.controller.ttyd", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/ttyd") then
		return
	end

	entry({"admin", "services", "ttyd"}, view("ttyd/term"), _("Terminal"), 3)
end
