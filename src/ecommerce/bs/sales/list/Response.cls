Class ecommerce.bs.sale.list.Response Extends ecommerce.bs.base.Response
{

Property SaleList As list Of ecommerce.model.Sale(%JSONFIELDNAME = "saleList");

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>SaleList</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
