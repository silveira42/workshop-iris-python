Include Ensemble

Class ecommerce.bo.user.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As ecommerce.bo.user.Operation, pRequest As ecommerce.bo.user.create.Request, Output pResponse As ecommerce.bo.user.create.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))

		Set userModel = pRequest.UserModel

		Set userData = ##class(ecommerce.data.Users).%New()
		Set userData.Name = userModel.Name
		Set userData.Email = userModel.Email
		Set userData.Phone = userModel.Phone
		Set userData.Address = userModel.Address

		$$$ThrowOnError(userData.%Save())

		Set createdUser = ##class(ecommerce.model.User).FromData(userData)

		Set pResponse.UserModel = createdUser
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
