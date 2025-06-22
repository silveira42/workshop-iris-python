Class ecommerce.dt.user.fromSchema Extends Ens.DataTransform
{

ClassMethod Transform(pSource As ecommerce.schema.UserCreate, Output pTarget As ecommerce.model.User) As %Library.Status
{
	Try
	{
		#Dim source As ecommerce.schema.UserCreate = pSource
		Set target = ##class(ecommerce.model.User).%New()

		Set target.Name = source.Name
		Set target.Email = source.Email
		Set target.Phone = source.Phone
		Set target.Address = ..GetAddress(source.PostalCode)

		Set pTarget = target

		Return $$$OK
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}
}

ClassMethod GetAddress(postalCode As %Library.String) As %Library.String [ Language = python ]
{
	import brazilcep

	address = brazilcep.get_address_from_cep(postalCode)

	return address["street"] + " - " + address["district"] + ", " + address["city"] + " - " + address["uf"] + ", " + address["cep"]
}

}
