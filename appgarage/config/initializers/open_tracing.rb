require 'jaeger/client'

OpenTracing.global_tracer = Jaeger::Client.build(
    host: "jaeger-agent",
    service_name: Rails.application.class.parent_name,
    reporter: Jaeger::Reporters::RemoteReporter.new(
        sender: Jaeger::HttpSender.new(
            url: 'http://jaeger-collector:14268/api/traces',
            headers: { 'key' => 'value' }, # headers key is optional
            encoder: Jaeger::Encoders::ThriftEncoder.new(service_name: Rails.application.class.parent_name)
        ),
        flush_interval: 1
    )
)

puts "Initialized jaeger tracer for #{Rails.application.class.parent_name}"