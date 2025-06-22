class EnablePgcrypto < ActiveRecord::Migration[8.0]
  def change
    enable_extension 'pgcrypto', if: -> { !extension_enabled?('pgcrypto') }
  end
end
