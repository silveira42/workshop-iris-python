Class ecommerce.bs.user.create.Response Extends ecommerce.bs.base.Response
{

Property UserModel As ecommerce.model.User(%JSONFIELDNAME = "user");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>UserModel</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
