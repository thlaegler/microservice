package com.laegler.microservice.adapter.util

import org.eclipse.xtend.lib.annotations.Accessors
import javax.inject.Named

@Named
@Accessors
class DiagramUtil {

	String dotColorRest = 'firebrick'
	String dotColorGrpc = 'dodgerblue'
	String dotColorJar = 'grey'
	String dotColorDraft = 'lightgrey'

	String umlColorRest = '#Red'
	String umlColorGrpc = '#Blue'
	String umlColorJar = '#Grey'
	String umlColorDraft = '#Lightgrey'

}
