-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

m = Map("ser2net", translate("Serial"), translate("Serial port proxy"))

g = m:section(NamedSection, "global", "ser2net", "")
g.addremove = false
g.anonymous = false

g1 = g:option(Flag, "enabled", "enable", translate("enable"))

d = m:section(TypedSection, "default", "")
d.addremove = false
d.anonymous = true

d1 = d:option(ListValue, "speed", "Baudrate", translate("Baudrate"))
d1:value("300",   "300")
d1:value("600",   "600")
d1:value("1200",  "1200")
d1:value("2400",  "2400")
d1:value("4800",  "4800")
d1:value("9600",  "9600")
d1:value("19200", "19200")
