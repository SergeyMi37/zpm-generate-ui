Class apptools.lte.compat
{

ClassMethod GetZpmClass(pNew As %String, pOld As %String) As %String [ Internal ]
{
	If ##class(%Dictionary.ClassDefinition).%ExistsId(pNew) {
		Return pNew
	} ElseIf ##class(%Dictionary.ClassDefinition).%ExistsId(pOld) {
		Return pOld
	} Else {
        zw pNew, pOld
        Break
		Throw ##class(%Exception.General).%New("IPM is not installed in namespace "_$NAMESPACE)
	}
}

ClassMethod GetZpmMainClass() As %String [ Internal ]
{
	Return ..GetZpmClass("%IPM.Main", "%ZPM.PackageManager")
}

ClassMethod GetZpmModuleClass() As %String [ Internal ]
{
	Return ..GetZpmClass("%IPM.Module.Storage", "%ZPM.PackageManager.Developer.Module")
}

ClassMethod GetZpmDefinitionClass() As %String [ Internal ]
{
    Return ..GetZpmClass("%IPM.Repo.Definition", "%ZPM.PackageManager.Client.ServerDefinition")
}

}