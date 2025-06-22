Class ecommerce.data.Users Extends %Library.Persistent
{

Property Name As %Library.String(MAXLEN = "");

Property Email As %Library.String(MAXLEN = "");

Property Phone As %Library.String(MAXLEN = "");

Property Address As %Library.String(MAXLEN = "");

Index UniqueEmail On Email [ Unique ];

Index UniquePhone On Phone [ Unique ];

Storage Default
{
<Data name="UsersDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Email</Value>
</Value>
<Value name="4">
<Value>Phone</Value>
</Value>
<Value name="5">
<Value>Address</Value>
</Value>
</Data>
<DataLocation>^ecommerce.data.UsersD</DataLocation>
<DefaultData>UsersDefaultData</DefaultData>
<IdLocation>^ecommerce.data.UsersD</IdLocation>
<IndexLocation>^ecommerce.data.UsersI</IndexLocation>
<StreamLocation>^ecommerce.data.UsersS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
