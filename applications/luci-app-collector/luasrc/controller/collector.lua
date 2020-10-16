-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.collector", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/collector") then
		return
	end
	
	local page

	page = entry({"admin", "services", "collector"}, cbi("collector"), _("Collector"), 2)
end
