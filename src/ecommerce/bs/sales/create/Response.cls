Class ecommerce.bs.sale.create.Response Extends ecommerce.bs.base.Response
{

Property SaleModel As ecommerce.model.Sale(%JSONFIELDNAME = "sale");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>SaleModel</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
