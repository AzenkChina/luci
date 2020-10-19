-- Copyright 2008 Steven Barth <steven@midlink.org>
-- Licensed to the public under the Apache License 2.0.

m = Map("collector", translate("Data Collect Service"),
	translate("Here you can define all parameters of the data collector program."))
m.apply_on_parse = true
m.on_after_apply = function(self)
	
end

g = m:section(NamedSection, "globals", "collector", translate("Global Settings"))

g1 = g:option(Flag, "enable", translate("Enabled"))
g1.rmempty = false

g2 = g:option(ListValue, "period", translate("Collect period"))
g2:value("5",    "5 minutes")
g2:value("10",  "10 minutes")
g2:value("15",  "15 minutes")
g2:value("30",  "30 minutes")
g2:value("60",  "60 minutes")

g3 = g:option(Value, "client", translate("Client address"))
g3.rmempty = false
g3.datatype = "and(uinteger,min(1),max(16383))"

g4 = g:option(Value, "logical", translate("Server logical address"))
g4.rmempty = false
g4.datatype = "and(uinteger,min(1),max(16383))"

g5 = g:option(Value, "physical", translate("Server physical address"))
g5.rmempty = false
g5.datatype = "and(uinteger,min(0),max(16383))"

g6 = g:option(ListValue, "mode", translate("Address mode"))
g6:value("1",  translate("1 byte"))
g6:value("2",  translate("2 bytes"))
g6:value("4",  translate("4 bytes"))

g7 = g:option(ListValue, "level", translate("Access level"))
g7:value("none", translate("None"))
g7:value("low",  translate("Password"))
g7:value("high", translate("Encryption"))

e = m:section(TypedSection, "element", translate("Element"))
e.addremove = true
e.anonymous = true

e1 = e:option(Value, "name", translate("Name"))
e1.rmempty = false
e1.maxlength = 32

e2 = e:option(ListValue, "class", translate("Class ID"))
e2:value("1",  "Data")
e2:value("3",  "Register")
e2:value("4",  "Extended Register")
e2:value("5",  "Demand Register")
e2:value("6",  "Register Activation")
e2:value("7",  "Profile Generic")
e2:value("8",  "Clock")
e2:value("63", "Status Mapping")

e3 = e:option(Value, "obis", translate("OBIS"))
e3.rmempty = false
e3.maxlength = 23
function e3:validate(value)
    return value:match("[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+")
end

e4 = e:option(Value, "index", translate("Attribute Index"))
e4.rmempty = false
e4.datatype = "and(uinteger,min(1),max(24))"

e5 = e:option(Flag, "delta", translate("Read by Cycle"))
e5.default = "1"
e5.rmempty = false
e5:depends({class="7"})

return m

