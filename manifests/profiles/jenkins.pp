class pve::profiles::jenkins{
  include ::jenkins

  jenkins::job { 'test-build-job':
    config  => template("${templates}/jenkins/blogr-build-job.xml.erb"),
  }

  # GIT plugin and all its dependencies.
  jenkins::plugin { 'git': }
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'matrix-project': }
  jenkins::plugin { 'workflow-scm-step': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'workflow-step-api': }
  jenkins::plugin { 'structs': }
  jenkins::plugin { 'junit': }
  jenkins::plugin { 'script-security': }
  jenkins::plugin { 'display-url-api': }

  #Pipeline v2.4 plugin and all its dependencies.
  jenkins::plugin { 'workflow-aggregator': }
  #workflow-cps v2.17 is missing. To fix, install v2.17 or later.
  #workflow-support v2.5 is missing. To fix, install v2.5 or later.
  #workflow-basic-steps v2.1 is missing. To fix, install v2.1 or later.
  #pipeline-input-step v2.1 is missing. To fix, install v2.1 or later.
  #pipeline-milestone-step v1.0 is missing. To fix, install v1.0 or later.
  #pipeline-build-step v2.2 is missing. To fix, install v2.2 or later.
  #pipeline-stage-view v2.0 is missing. To fix, install v2.0 or later.
  #workflow-multibranch v2.8 is missing. To fix, install v2.8 or later.
  #workflow-durable-task-step v2.4 is missing. To fix, install v2.4 or later.
  #workflow-api v2.3 is missing. To fix, install v2.3 or later.
  #pipeline-stage-step v2.2 is missing. To fix, install v2.2 or later.
  #workflow-scm-step v2.2 is missing. To fix, install v2.2 or later.
  #workflow-cps-global-lib v2.3 is missing. To fix, install v2.3 or later.
  #workflow-step-api v2.3 is missing. To fix, install v2.3 or later.
  #workflow-job v2.6 is missing. To fix, install v2.6 or later.

}
