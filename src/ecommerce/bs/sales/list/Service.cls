Class ecommerce.bs.sale.list.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.sale.list.Request, Output pOutput As ecommerce.bs.sale.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.sale.list.Request).%New()

		$$$ThrowOnError(..SendRequestSync("Ecommerce Sale List", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.sale.list.Response

		Set pOutput.SaleList = bpResponse.Sales
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method Translate(text As %Library.String, lang As %Library.String = "pt") As %Library.String [ Language = python ]
{
	from translate import Translator
	translator = Translator(to_lang=lang)
	translation = translator.translate(text)

	return translation
}

}
