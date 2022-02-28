{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "simpleapp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "simpleapp.common.matchLabels" -}}
app: {{ template "simpleapp.name" . }}
release: {{ .Release.Name}}
{{- end -}}

{{- define "simpleapp.common.metaLabels" -}}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
heritage: {{ .Release.Service }}
{{- end -}}



{{- define "simpleapp.ui.labels" -}}
{{ include "simpleapp.ui.matchLabels" . }}
{{ include "simpleapp.common.metaLabels" . }}
{{- end -}}

{{- define "simpleapp.ui.matchLabels" -}}
component: {{ .Values.ui.name | quote}}
{{ include "simpleapp.common.matchLabels" . }}
{{- end -}}

{{- define "simpleapp.ms.labels" -}}
{{ include "simpleapp.ms.matchLabels" . }}
{{ include "simpleapp.common.metaLabels" . }}
{{- end -}}

{{- define "simpleapp.ms.matchLabels" -}}
component: {{ .Values.ms.name | quote}}
{{ include "simpleapp.common.matchLabels" . }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "simpleapp.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "simpleapp.ui.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "simpleapp.ms.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ms.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}