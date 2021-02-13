class LaController < ApplicationController
  def top
    @ms = MineStat.new("192.168.0.8")
    # <%= @ms.json_data %><%= @ms.protocol %><%= @ms.query_type %>
  end

  def first
  end

  def news
  end

  def info
  end

  def calender
  end

  def map
  end

  def search
  end
end
