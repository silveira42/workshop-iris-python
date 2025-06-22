Class ecommerce.model.User Extends (%Library.SerialObject, %JSON.Adaptor)
{

Property Name As %Library.String(%JSONFIELDNAME = "name", MAXLEN = "");

Property Email As %Library.String(%JSONFIELDNAME = "email", MAXLEN = "");

Property Phone As %Library.String(%JSONFIELDNAME = "phone", MAXLEN = "");

Property Address As %Library.String(%JSONFIELDNAME = "address", MAXLEN = "");

ClassMethod FromData(pData As ecommerce.data.Users) As ecommerce.model.User
{
	Set data = pData

	Set user = ##class(ecommerce.model.User).%New()

	Set user.Name = data.Name
	Set user.Email = data.Email
	Set user.Phone = data.Phone
	Set user.Address = data.Address

	Return user
}

Storage Default
{
<Data name="UserState">
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
<Value>Address</Value>
</Value>
</Data>
<State>UserState</State>
<StreamLocation>^ecommerce.model.UserS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
