package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.FileUtil
import com.laegler.microservice.adapter.util.NamingStrategy
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.EndpointType
import com.laegler.microservice.model.Expose
import com.laegler.microservice.model2code.template.microservice.grpc.GrpcPomXml
import com.laegler.microservice.model2code.template.microservice.grpc.gen.client.DefaultGrpcClientXtend
import com.laegler.microservice.model2code.template.microservice.grpc.res.GrpcProto
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.junit.MockitoJUnitRunner
import org.slf4j.Logger
import org.slf4j.LoggerFactory

import static org.junit.Assert.*
import static org.mockito.ArgumentMatchers.*
import static org.mockito.Mockito.*

@RunWith(MockitoJUnitRunner.Silent)
class GrpcProjectGeneratorTest {

	protected static Logger log = LoggerFactory.getLogger(GrpcProjectGeneratorTest)

	@InjectMocks GrpcProjectGenerator unitUnderTest
	Architecture architecture
	Template template

	@Mock GrpcPomXml grpcPomXmlMock
	@Mock GrpcProto grpcProtoMock
	@Mock DefaultGrpcClientXtend defaultGrpcClientXtendMock
	@Mock World worldMock
	@Mock FileUtil fileHelperMock
	@Mock NamingStrategy namingStrategyMock

	@Before
	def void setup() {
		MockitoAnnotations.initMocks(unitUnderTest);

		architecture = new Architecture => [
			name = 'test-project'
			artifacts = #[
				new Artifact => [
					name = 'product'
					exposes = #[
						new Expose => [
							name = 'ProductRest'
							endpointType = EndpointType.GRPC
						]
					]
				]
			]
		]

		doReturn(template).when(grpcPomXmlMock).getTemplate(any())
		doReturn(template).when(grpcProtoMock).getTemplate(any(), any())
		doReturn(template).when(defaultGrpcClientXtendMock).getTemplate(any())

		doReturn('product-grpc').when(namingStrategyMock).getProjectName('product', 'grpc')
	}

	@Test
	def void test_generate() {
		val projects = unitUnderTest.generate(architecture)

		assertNotNull(projects)
		assertEquals(1, projects.size)
	}

}