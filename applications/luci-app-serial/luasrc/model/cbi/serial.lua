-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

m = Map("ser2net", translate("Serial"), translate("Serial port proxy"))

s = m:section(TypedSection, "ser2net", "")
s.addremove = false
s.anonymous = true

s:tab("Global", translate("Global Configuration"))
enabled = s:taboption("basic", Flag, "enabled", translate("Enable"))

return m
