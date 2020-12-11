require 'rack'

class MiddlewareRuta

    def initialize(midd)
        @midd = midd
    end

    def call(env)
        status, headers, response = @midd.call(env)

        if env['REQUEST_PATH'] == '/precio' or env['REQUEST_PATH'] == '/dias' or env['REQUEST_PATH'] == '/edad' or env['REQUEST_PATH'] == '/stocks' or env['REQUEST_PATH'] == '/puntos'
            cad = StringIO.new("Debe completar la url #{env['REQUEST_PATH']} con lo necesario para realizar la consulta")
            h = {"Content-Type" => "text/plain"}
            [status, h, cad]

        else
            [status, headers, response]
        end
    end
end
