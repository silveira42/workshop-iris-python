Class ecommerce.schema.UserCreate Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Name As %Library.String(%JSONFIELDNAME = "name", MAXLEN = "");

Property Email As %Library.String(%JSONFIELDNAME = "email", MAXLEN = "");

Property Phone As %Library.String(%JSONFIELDNAME = "phone", MAXLEN = "");

Property PostalCode As %Library.String(%JSONFIELDNAME = "postalCode", MAXLEN = "");

Storage Default
{
<Data name="UserCreateState">
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>Email</Value>
</Value>
<Value name="3">
<Value>Phone</Value>
</Value>
<Value name="4">
<Value>PostalCode</Value>
</Value>
</Data>
<State>UserCreateState</State>
<StreamLocation>^ecommerce.schema.UserCreateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
