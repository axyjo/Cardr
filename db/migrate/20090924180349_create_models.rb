class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :spacing, :float, :default => 600.0
      t.timestamps
    end
    init_model = Model.new(:name => 'Basic', :description => 'Basic')
    Representation.new(:model_id => init_model.id, :name => 'Forward', :active => true, :qformat => '%(Front)', :aformat => '%(Back)')
    Representation.new(:model_id => init_model.id, :name => 'Reverse', :active => false, :qformat => '%(Back)', :aformat => '%(Front)')
  end

  def self.down
    drop_table :models
  end
end
