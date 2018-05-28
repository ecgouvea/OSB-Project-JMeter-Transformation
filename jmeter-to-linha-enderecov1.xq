(:: pragma bea:global-element-parameter parameter="$testResults1" element="ns0:testResults" location="jtl.xsd" ::)
(:: pragma bea:global-element-return element="ns1:linhas" location="linha.xsd" ::)

declare namespace ns1 = "http://www.example.org/linha";
declare namespace ns0 = "http://xmlbeans.testresults.server.report.jmeter.excentia.es";
declare namespace xf = "http://tempuri.org/OSB%20Project%201/xquery/jmeter-to-linha/";

declare function xf:jmeter-to-linha($testResults1 as element(ns0:testResults))
    as element(ns1:linhas) {
<ns1:linhas>
<ns1:linha>
{fn:concat('&#xa;cep&#x9;duracao_esb&#x9;timestamp&#x9;resultado')}
{
for $httpSample in $testResults1/ns0:httpSample
	return fn:concat(
		'&#xa;'
		, fn:data($httpSample/ns0:queryString//*:cep)
		, '&#x9;'
		, fn:data($httpSample/@t)
		, '&#x9;'
		, fn:data($httpSample/@ts)
		, '&#x9;'
		, fn:concat(fn:data($httpSample/ns0:responseData//*:logradouro)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:tipoLogradouro)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:numero)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:complemento)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:bairro)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:cidade)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:uf)
				  , '-'
				  , fn:data($httpSample/ns0:responseData//*:estado)
		)
	)
}
{fn:concat('&#xa;')}

			</ns1:linha>
        </ns1:linhas>
};

declare variable $testResults1 as element(ns0:testResults) external;

xf:jmeter-to-linha($testResults1)