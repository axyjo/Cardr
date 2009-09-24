class CreateRepresentations < ActiveRecord::Migration
  def self.up
    create_table :representations do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :active, :boolean
      t.column :qformat, :text
      t.column :aformat, :text
      t.timestamps
    end
    Representation.new(:name => 'Forward', :active => true, :qformat => '%(Front)', :aformat => '%(Back)')
    Representation.new(:name => 'Reverse', :active => false, :qformat => '%(Back)', :aformat => '%(Front)')
  end

  def self.down
    drop_table :representations
  end
end
