Class ecommerce.data.Sales Extends %Library.Persistent
{

Property SalesDate As %Library.String;

Property RawValue As %Library.Numeric;

Property Discount As %Library.Numeric;

Property ICMS As %Library.Numeric;

Property ISS As %Library.Numeric;

Query CalculateRevenue(dataInicio As %Library.String, dataFim As %Library.String) As %Library.SQLQuery [ SqlProc ]
{
    SELECT
        SUM(RawValue) AS RawValue,
        SUM(Discount) AS Discount,
        SUM(RawValue) - SUM(Discount) AS LiquidRevenue,
        COUNT(*) AS SalesQuantity,
        SUM(ICMS) AS ICMS,
        SUM(ISS) AS ISS
    FROM ecommerce_data.Sales
    WHERE SalesDate BETWEEN :dataInicio AND :dataFim
}

Storage Default
{
<Data name="SalesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SalesDate</Value>
</Value>
<Value name="3">
<Value>RawValue</Value>
</Value>
<Value name="4">
<Value>Discount</Value>
</Value>
<Value name="5">
<Value>ICMS</Value>
</Value>
<Value name="6">
<Value>ISS</Value>
</Value>
</Data>
<DataLocation>^ecommerce.data.SalesD</DataLocation>
<DefaultData>SalesDefaultData</DefaultData>
<IdLocation>^ecommerce.data.SalesD</IdLocation>
<IndexLocation>^ecommerce.data.SalesI</IndexLocation>
<StreamLocation>^ecommerce.data.SalesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
