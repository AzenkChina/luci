-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2011-2018 Jo-Philipp Wich <jo@mein.io>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.admin.network", package.seeall)

function index()
	local page

--	if page.inreq then
		page = entry({"admin", "system", "wireless"}, view("network/wireless"), _('Wireless'), 15)
		page.uci_depends = { wireless = { ["@wifi-device[0]"] = "wifi-device" } }
		page.leaf = true
--	end
end
