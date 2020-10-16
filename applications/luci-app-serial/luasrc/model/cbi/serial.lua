-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Copyright 2008 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

m = Map("ser2net", translate("Serial Port Proxy"), translate("Here you can configure the serial ports and their forward ports."))
m.apply_on_parse = true
m.on_after_apply = function(self)
	io.popen("/etc/init.d/ser2net restart")
end



g = m:section(NamedSection, "global", "ser2net", translate("Global Settings"))

g1 = g:option(Flag, "enabled", translate("Enable"))
g1.rmempty = false



d = m:section(NamedSection, "default", "default")

d1 = d:option(ListValue, "speed", translate("Baudrate"))
d1:value("300",    translate("300"))
d1:value("600",    translate("600"))
d1:value("1200",   translate("1200"))
d1:value("2400",   translate("2400"))
d1:value("4800",   translate("4800"))
d1:value("9600",   translate("9600"))
d1:value("19200",  translate("19200"))
d1:value("38400",  translate("38400"))
d1:value("57600",  translate("57600"))
d1:value("115200", translate("115200"))

d2 = d:option(ListValue, "databits", translate("DataBits"))
d2:value("7", translate("7bits"))
d2:value("8", translate("8bits"))
d2:value("9", translate("9bits"))

d3 = d:option(ListValue, "parity", translate("Parity"))
d3:value("none", translate("None"))
d3:value("even", translate("Even"))
d3:value("odd", translate("Odd"))

d4 = d:option(ListValue, "stopbits", translate("StopBits"))
d4:value("1", translate("1bit"))
d4:value("2", translate("2bits"))



i = m:section(NamedSection, "interactive", "proxy", translate("Interactive Port Settings"))

i1 = i:option(Flag, "enabled", translate("Enable"))
i1.rmempty = false

i2 = i:option(Value, "port", translate("Port"))
i2.maxlength = 5
i2.datatype = 'port'

o = m:section(NamedSection, "monitor", "proxy", translate("Monitor Port Settings"))

o1 = o:option(Flag, "enabled", translate("Enable"))
o1.rmempty = false

o2 = o:option(Value, "port", translate("Port"))
o2.maxlength = 5
o2.datatype = 'port'

return m
