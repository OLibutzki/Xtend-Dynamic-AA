package module1

import org.springframework.boot.autoconfigure.EnableAutoConfiguration
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.Bean

@EnableAutoConfiguration
@Configuration
class Module1Configuration {

	@Bean
	def Module1StringProcessor toStringProcessor() {
		return new Module1StringProcessor
	}

}
