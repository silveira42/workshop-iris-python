Class ecommerce.bp.user.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "ecommerce.bp.user.create.Response";

Property UserSchema As ecommerce.schema.UserCreate;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>UserSchema</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
