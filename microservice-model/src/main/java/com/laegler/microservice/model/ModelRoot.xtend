package com.laegler.microservice.model

import lombok.AllArgsConstructor
import lombok.Builder
import lombok.NoArgsConstructor
import org.eclipse.xtend.lib.annotations.Accessors

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors
class ModelRoot {

	Architecture architecture;

}
