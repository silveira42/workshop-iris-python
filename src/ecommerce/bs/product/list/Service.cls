Class ecommerce.bs.product.list.Service Extends Ens.BusinessService
{

Method OnProcessInput(pInput As ecommerce.bs.product.list.Request, Output pOutput As ecommerce.bs.product.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pInput.NewResponse(.pOutput))

		Set bpRequest = ##class(ecommerce.bp.product.list.Request).%New()

		$$$ThrowOnError(..SendRequestSync("Ecommerce Product List", bpRequest, .bpResponse))
		#Dim bpResponse As ecommerce.bp.product.list.Response

		For i = 1:1:bpResponse.Products.Count()
		{
			Set product = bpResponse.Products.GetAt(i)
			Set product.Description = ..Translate(product.Description, pInput.Lang)

			If (product.Description [ "IS AN INVALID TARGET LANGUAGE")
			{
				Throw ##class(%Exception.General).%New("Invalid target language (" _ pInput.Lang _ ") for translation.", 400)
			}
		}

		Set pOutput.ProductList = bpResponse.Products
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
