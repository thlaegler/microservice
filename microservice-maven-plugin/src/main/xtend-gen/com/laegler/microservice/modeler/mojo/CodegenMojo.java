package com.laegler.microservice.modeler.mojo;

import com.google.common.base.Objects;
import com.laegler.microservice.modeler.mojo.util.Microservice;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.Factory;
import guru.nidi.graphviz.model.Graph;
import java.io.File;
import java.io.FileReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.function.Consumer;
import org.apache.commons.io.FileUtils;
import org.apache.maven.model.Dependency;
import org.apache.maven.model.Model;
import org.apache.maven.model.io.xpp3.MavenXpp3Reader;
import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.MojoFailureException;
import org.apache.maven.plugins.annotations.LifecyclePhase;
import org.apache.maven.plugins.annotations.Mojo;
import org.apache.maven.plugins.annotations.Parameter;
import org.apache.maven.plugins.annotations.ResolutionScope;
import org.apache.maven.project.MavenProject;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.xbase.lib.Conversions;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@Mojo(name = "codegen", defaultPhase = LifecyclePhase.GENERATE_SOURCES, threadSafe = true, requiresDependencyResolution = ResolutionScope.COMPILE)
@SuppressWarnings("all")
public class CodegenMojo extends AbstractMojo {
  @Parameter(defaultValue = "${project}", readonly = true)
  private MavenProject project;
  
  @Parameter(property = "skipCodeGen", defaultValue = "false", required = false, readonly = true)
  private boolean skipCodeGen;
  
  @Parameter(property = "targetDirectory", defaultValue = "${project.build.outputDirectory}/generated", required = false, readonly = true)
  private File targetDirectory;
  
  private File baseDir;
  
  private String projectEncoding;
  
  private final List<Microservice> microservices = new ArrayList<Microservice>();
  
  private final MavenXpp3Reader mavenreader = new MavenXpp3Reader();
  
  private final String dotColorRest = "firebrick";
  
  private final String dotColorGrpc = "dodgerblue";
  
  private final String dotColorJar = "grey";
  
  private final String dotColorDraft = "lightgrey";
  
  public void execute() throws MojoExecutionException, MojoFailureException {
    if (this.skipCodeGen) {
      this.getLog().info("Code Generation is skipped.");
      return;
    }
    File _basedir = null;
    if (this.project!=null) {
      _basedir=this.project.getBasedir();
    }
    this.baseDir = _basedir;
    Properties _properties = null;
    if (this.project!=null) {
      _properties=this.project.getProperties();
    }
    String _property = null;
    if (_properties!=null) {
      _property=_properties.getProperty("project.build.sourceEncoding");
    }
    this.projectEncoding = _property;
    File[] _listFiles = null;
    if (this.baseDir!=null) {
      _listFiles=this.baseDir.listFiles();
    }
    Iterable<File> _filter = null;
    if (((Iterable<File>)Conversions.doWrapArray(_listFiles))!=null) {
      final Function1<File, Boolean> _function = new Function1<File, Boolean>() {
        public Boolean apply(final File it) {
          File[] _listFiles = null;
          if (it!=null) {
            _listFiles=it.listFiles();
          }
          return Boolean.valueOf((!Objects.equal(_listFiles, null)));
        }
      };
      _filter=IterableExtensions.<File>filter(((Iterable<File>)Conversions.doWrapArray(_listFiles)), _function);
    }
    final Consumer<File> _function_1 = new Consumer<File>() {
      public void accept(final File m) {
        try {
          File[] _listFiles = null;
          if (m!=null) {
            _listFiles=m.listFiles();
          }
          File _findFirst = null;
          if (((Iterable<File>)Conversions.doWrapArray(_listFiles))!=null) {
            final Function1<File, Boolean> _function = new Function1<File, Boolean>() {
              public Boolean apply(final File it) {
                return Boolean.valueOf(it.getName().equals("pom.xml"));
              }
            };
            _findFirst=IterableExtensions.<File>findFirst(((Iterable<File>)Conversions.doWrapArray(_listFiles)), _function);
          }
          File pomXmlFile = _findFirst;
          FileReader _fileReader = new FileReader(pomXmlFile);
          Model model = CodegenMojo.this.mavenreader.read(_fileReader);
          String _artifactId = model.getArtifactId();
          boolean _equals = false;
          if (_artifactId!=null) {
            String _name = null;
            if (pomXmlFile!=null) {
              _name=pomXmlFile.getName();
            }
            _equals=_artifactId.equals(_name);
          }
          boolean _not = (!_equals);
          if (_not) {
            CodegenMojo.this.getLog().warn("Project name and Folder name are not equal.");
          }
          boolean _notEquals = (!Objects.equal(model, null));
          if (_notEquals) {
            String _artifactId_1 = null;
            if (model!=null) {
              _artifactId_1=model.getArtifactId();
            }
            Microservice _microservice = new Microservice(_artifactId_1, model, m);
            CodegenMojo.this.microservices.add(_microservice);
          }
        } catch (Throwable _e) {
          throw Exceptions.sneakyThrow(_e);
        }
      }
    };
    _filter.forEach(_function_1);
    if (this.microservices!=null) {
      final Consumer<Microservice> _function_2 = new Consumer<Microservice>() {
        public void accept(final Microservice it) {
          CodegenMojo.this.createMicroservice(it);
        }
      };
      this.microservices.forEach(_function_2);
    }
    this.createAndWriteFile(this.getDotGraphFile2(), this.createFileName(this.baseDir, "architecture.component.plantuml"));
  }
  
  public void createMicroservice(final Microservice m) {
    this.createAndWriteFile(this.getSubsetFile(m), this.createFileName(m.getDirectory(), "subset.txt"));
    this.createAndWriteFile(this.getKubeFile(m), this.createFileName(m.getDirectory(), "subset.txt"));
  }
  
  public String getSubsetFile(final Microservice microservice) {
    StringConcatenation _builder = new StringConcatenation();
    return _builder.toString();
  }
  
  public String getKubeFile(final Microservice microservice) {
    StringConcatenation _builder = new StringConcatenation();
    return _builder.toString();
  }
  
  public String getDotGraphFile() {
    StringConcatenation _builder = new StringConcatenation();
    {
      for(final Microservice m : this.microservices) {
        _builder.append("\t");
        _builder.newLine();
      }
    }
    return _builder.toString();
  }
  
  public String getDotGraphFile2() {
    String _xblockexpression = null;
    {
      final Graph g = Factory.graph("Microservices").directed().with(Factory.node("a"));
      final Map<String, Graph> mSubGraph = new HashMap<String, Graph>();
      if (this.microservices!=null) {
        final Consumer<Microservice> _function = new Consumer<Microservice>() {
          public void accept(final Microservice m) {
            final Graph s = Factory.graph(m.getName()).directed().cluster().with(Factory.node(m.getName()).with("color", "black").with("shape", "box"));
            g.with(s);
            mSubGraph.put(m.getName(), s);
          }
        };
        this.microservices.forEach(_function);
      }
      if (this.microservices!=null) {
        final Consumer<Microservice> _function_1 = new Consumer<Microservice>() {
          public void accept(final Microservice m) {
            Model _pom = m.getPom();
            final Procedure1<Model> _function = new Procedure1<Model>() {
              public void apply(final Model it) {
                final Graph domainComponent = mSubGraph.get(it.getArtifactId()).with(Factory.node(m.getName()).with("shape", "box"));
                mSubGraph.get(it.getArtifactId()).with(domainComponent);
                final Function1<Dependency, Boolean> _function = new Function1<Dependency, Boolean>() {
                  public Boolean apply(final Dependency d) {
                    String _groupId = it.getGroupId();
                    String _groupId_1 = d.getGroupId();
                    return Boolean.valueOf(Objects.equal(_groupId, _groupId_1));
                  }
                };
                final Consumer<Dependency> _function_1 = new Consumer<Dependency>() {
                  public void accept(final Dependency d) {
                    String _artifactId = d.getArtifactId();
                    String _plus = (_artifactId + ".jar");
                    domainComponent.link(Factory.node(_plus).with("color", CodegenMojo.this.dotColorJar).with("label", "uses JAR"));
                  }
                };
                IterableExtensions.<Dependency>filter(it.getDependencies(), _function).forEach(_function_1);
              }
            };
            ObjectExtensions.<Model>operator_doubleArrow(_pom, _function);
          }
        };
        this.microservices.forEach(_function_1);
      }
      _xblockexpression = Graphviz.fromGraph(g).width(800).render(Format.PNG).toString();
    }
    return _xblockexpression;
  }
  
  public String getDotGraphFile3() {
    String _xblockexpression = null;
    {
      final ArrayList<String> services = new ArrayList<String>();
      services.add("digraph Microservices {");
      services.add(" ");
      if (this.microservices!=null) {
        final Consumer<Microservice> _function = new Consumer<Microservice>() {
          public void accept(final Microservice m) {
            Model _pom = m.getPom();
            final Procedure1<Model> _function = new Procedure1<Model>() {
              public void apply(final Model it) {
                StringConcatenation _builder = new StringConcatenation();
                _builder.append("\t");
                _builder.append("subgraph \"cluster_");
                String _artifactId = it.getArtifactId();
                _builder.append(_artifactId, "\t");
                _builder.append("\" {");
                services.add(_builder.toString());
                StringConcatenation _builder_1 = new StringConcatenation();
                _builder_1.append("\t\t");
                _builder_1.append("color=black;");
                services.add(_builder_1.toString());
                StringConcatenation _builder_2 = new StringConcatenation();
                _builder_2.append("\t\t");
                _builder_2.append("shape=box;");
                services.add(_builder_2.toString());
                StringConcatenation _builder_3 = new StringConcatenation();
                _builder_3.append("\t\t");
                _builder_3.append("label = \"Service: ");
                String _artifactId_1 = it.getArtifactId();
                _builder_3.append(_artifactId_1, "\t\t");
                _builder_3.append("\";");
                services.add(_builder_3.toString());
                StringConcatenation _builder_4 = new StringConcatenation();
                _builder_4.append("\t\t");
                _builder_4.append("\"");
                String _artifactId_2 = it.getArtifactId();
                _builder_4.append(_artifactId_2, "\t\t");
                _builder_4.append("\" [label=\"");
                String _artifactId_3 = it.getArtifactId();
                _builder_4.append(_artifactId_3, "\t\t");
                _builder_4.append("\", shape=box];");
                services.add(_builder_4.toString());
                final Function1<Dependency, Boolean> _function = new Function1<Dependency, Boolean>() {
                  public Boolean apply(final Dependency d) {
                    String _groupId = it.getGroupId();
                    String _groupId_1 = d.getGroupId();
                    return Boolean.valueOf(Objects.equal(_groupId, _groupId_1));
                  }
                };
                final Consumer<Dependency> _function_1 = new Consumer<Dependency>() {
                  public void accept(final Dependency d) {
                    StringConcatenation _builder = new StringConcatenation();
                    _builder.append("\t\t");
                    _builder.append("\"");
                    String _artifactId = it.getArtifactId();
                    _builder.append(_artifactId, "\t\t");
                    String _artifactId_1 = d.getArtifactId();
                    _builder.append(_artifactId_1, "\t\t");
                    _builder.append(".jar\" [label=\"");
                    String _artifactId_2 = d.getArtifactId();
                    _builder.append(_artifactId_2, "\t\t");
                    _builder.append(".jar\", shape=box, style=filled, fontname=arial, fontsize=8, color=");
                    _builder.append(CodegenMojo.this.dotColorJar, "\t\t");
                    _builder.append("];");
                    services.add(_builder.toString());
                    StringConcatenation _builder_1 = new StringConcatenation();
                    _builder_1.append("\t\t");
                    _builder_1.append("\"");
                    String _artifactId_3 = it.getArtifactId();
                    _builder_1.append(_artifactId_3, "\t\t");
                    _builder_1.append("\" -> \"");
                    String _artifactId_4 = it.getArtifactId();
                    _builder_1.append(_artifactId_4, "\t\t");
                    String _artifactId_5 = d.getArtifactId();
                    _builder_1.append(_artifactId_5, "\t\t");
                    _builder_1.append(".jar\" [label=\"uses JAR\", color=");
                    _builder_1.append(CodegenMojo.this.dotColorJar, "\t\t");
                    _builder_1.append(", fontname=arial, fontsize=8];");
                    services.add(_builder_1.toString());
                  }
                };
                IterableExtensions.<Dependency>filter(it.getDependencies(), _function).forEach(_function_1);
                StringConcatenation _builder_5 = new StringConcatenation();
                _builder_5.append("\t");
                _builder_5.append("}");
                services.add(_builder_5.toString());
              }
            };
            ObjectExtensions.<Model>operator_doubleArrow(_pom, _function);
          }
        };
        this.microservices.forEach(_function);
      }
      services.add(" ");
      services.add("}");
      _xblockexpression = IterableExtensions.join(services, System.getProperty("line.separator"));
    }
    return _xblockexpression;
  }
  
  private File createFile(final String suffix, final String extenzion) {
    try {
      File _xblockexpression = null;
      {
        this.project.getArtifactId();
        StringConcatenation _builder = new StringConcatenation();
        _builder.append(File.separator);
        String _artifactId = this.project.getArtifactId();
        _builder.append(_artifactId);
        _builder.append("-");
        _builder.append(suffix);
        _builder.append(".");
        _builder.append(extenzion);
        final String path = _builder.toString();
        StringConcatenation _builder_1 = new StringConcatenation();
        _builder_1.append(File.separator);
        String _artifactId_1 = this.project.getArtifactId();
        _builder_1.append(_artifactId_1);
        _builder_1.append("-");
        _builder_1.append(suffix);
        _builder_1.append(".");
        _builder_1.append(extenzion);
        final File file = new File(_builder_1.toString());
        file.getParentFile().mkdirs();
        file.createNewFile();
        _xblockexpression = file;
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  private void createAndWriteFile(final String content, final String pathname) {
    try {
      File _file = new File(pathname);
      final Procedure1<File> _function = new Procedure1<File>() {
        public void apply(final File it) {
          try {
            it.getParentFile().mkdirs();
            it.createNewFile();
          } catch (Throwable _e) {
            throw Exceptions.sneakyThrow(_e);
          }
        }
      };
      File _doubleArrow = ObjectExtensions.<File>operator_doubleArrow(_file, _function);
      FileUtils.writeStringToFile(_doubleArrow, content, 
        Charset.defaultCharset());
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  private String createFileName(final File dir, final String filename) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append(dir);
    _builder.append(File.separator);
    _builder.append(filename);
    return _builder.toString();
  }
}
