# frozen_string_literal: true

require 'sinatra'
require 'gdbm'

module App
  module_function

  def set(request)
    gdbm = GDBM.new('api.db')
    data = JSON.parse request.body.read
    gdbm[data['key']] = data['value']
    gdbm.close
    [set_status]
  end

  def get(query)
    gdbm = GDBM.new('api.db')
    key = query.gsub(/[''','"']/, '')
    data = key.split(':')
    value = gdbm[data[1]]
    gdbm.close
    value ? [succes_status, value.to_s] : error_status
  end

  def succes_status
    @succes_status = 200
  end

  def error_status
    @error_status = 404
  end

  def set_status
    @set_status = 201
  end
end

post('/set') { App.new.set(request) }

get('/get:query') { App.get(params['query']) }

get('/get') { App.new.get(params['query']) }
