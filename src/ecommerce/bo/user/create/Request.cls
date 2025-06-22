Class ecommerce.bo.user.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bo.user.create.Response";

Property UserModel As ecommerce.model.User;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>UserModel</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
