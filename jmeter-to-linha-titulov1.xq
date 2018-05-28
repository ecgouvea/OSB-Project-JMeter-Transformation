(:: pragma bea:global-element-parameter parameter="$testResults1" element="ns0:testResults" location="jtl.xsd" ::)
(:: pragma bea:global-element-return element="ns1:linhas" location="linha.xsd" ::)

declare namespace ns1 = "http://www.example.org/linha";
declare namespace ns0 = "http://xmlbeans.testresults.server.report.jmeter.excentia.es";
declare namespace xf = "http://tempuri.org/OSB%20Project%201/xquery/jmeter-to-linha/";

declare function xf:jmeter-to-linha($testResults1 as element(ns0:testResults))
    as element(ns1:linhas) {
<ns1:linhas>
	<ns1:linha>
{fn:concat('&#xa;response_time&#x9;timestamp&#x9;response_code')}
{
for $httpSample in $testResults1/ns0:httpSample
	return fn:concat(
		'&#xa;'
		, fn:data($httpSample/@t)
		, '&#x9;'
		, fn:data($httpSample/@ts)
		, '&#x9;'
		, fn:data($httpSample/@rc)
	)
}
{fn:concat('&#xa;')}

	</ns1:linha>
</ns1:linhas>
};

declare variable $testResults1 as element(ns0:testResults) external;

xf:jmeter-to-linha($testResults1)