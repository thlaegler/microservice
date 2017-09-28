package com.laegler.microservice.model2code.generator

import com.laegler.microservice.adapter.model.Template
import com.laegler.microservice.adapter.model.World
import com.laegler.microservice.adapter.util.DefaultNamingStrategy
import com.laegler.microservice.adapter.util.FileUtil
import com.laegler.microservice.model.Architecture
import com.laegler.microservice.model.Artifact
import com.laegler.microservice.model.EndpointType
import com.laegler.microservice.model.Expose
import com.laegler.microservice.model2code.template.microservice.grpc.GrpcPomXml
import com.laegler.microservice.model2code.template.microservice.grpc.GrpcProjectGenerator
import com.laegler.microservice.model2code.template.microservice.grpc.client.gen.DefaultGrpcClientXtend
import com.laegler.microservice.model2code.template.microservice.grpc.model.res.GrpcProto
import org.junit.Ignore
import org.junit.runner.RunWith
import org.mockito.InjectMocks
import org.mockito.Mock
import org.mockito.MockitoAnnotations
import org.mockito.junit.MockitoJUnitRunner
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.junit.Test
import org.junit.Before

import static org.mockito.ArgumentMatchers.*
import static org.mockito.Mockito.*

//@RunWith(MockitoJUnitRunner.Silent)
class GrpcProjectGeneratorTest {

	protected static Logger log = LoggerFactory.getLogger(GrpcProjectGeneratorTest)

	@InjectMocks GrpcProjectGenerator unitUnderTest
	Architecture architecture
	Template template
	Template.Builder templateBuilder

	@Mock GrpcPomXml grpcPomXmlMock
	@Mock GrpcProto grpcProtoMock
	@Mock DefaultGrpcClientXtend defaultGrpcClientXtendMock
	@Mock World worldMock
	@Mock FileUtil fileHelperMock
	@Mock DefaultNamingStrategy namingStrategyMock

	@Before
	def void setup() {
		MockitoAnnotations.initMocks(unitUnderTest);
		templateBuilder = Template.builder
		template = templateBuilder.build

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
		
		when(namingStrategyMock.getProjectName(any())).thenCallRealMethod
		when(namingStrategyMock.srcPath).thenCallRealMethod
//		doReturn(templateBuilder.build).when(grpcPomXmlMock).getTemplate(any())
		
		// TODO:
		doReturn(templateBuilder.build).when(grpcPomXmlMock).getTemplate(any())
		doReturn(template).when(grpcProtoMock).getTemplate(any(), any())
		doReturn(template).when(defaultGrpcClientXtendMock).getTemplate(any())

		doReturn('product-grpc').when(namingStrategyMock).getProjectName('product', 'grpc')
	}

	@Test
	@Ignore
	def void test_generate() {
		val projects = unitUnderTest.generate(architecture)

//		assertNotNull(projects)
//		assertEquals(1, projects.size)
	}

}
