class CreateQuestions < ActiveRecord::Migration[5.1]

  #Migrations are used to change the structure of the database. Migrations should
 # be used for things like: creating tables, removing tables, adding columns
 # removing columns, altering columns, adding indexes, removing indexes..etc

 # You will notice that every migration file has a number at the start of it
 # the number is a timestamp and is used to order the migrations properly. We
 # want our migrations to run in the order we create them. For example, we create
 # the questions table here and maybe later we add a column in another migration
 # to the questions table. But if the table is not created already then the
 # migration to add a column to it will fail. This number is also used by Rails
# to keep track of the migration that have been executed already. Also, if you
# already created the `questions` table, you don't want to create it again so
# once the migration gets exectued you want it not to get exected again.

# The below is created by doing this in the Terminal:
# rails g model question title:string body:text
  def change
    #below is Ruby code which is a DSL for Rails migraton
    #the line below generates a table called 'questions'. Every table will automatically have a primary key called 'id' (serial). Although not shown here, it will be created with every table.
    create_table :questions do |t|
      t.string :title   #This will create VARCHAR(50) in Postgres
      t.text :body    #This will create TEXT in Postgres

      #This below will creat 2 fields in the database: created_at & updated_at. Both are timestamps which will be automatically set the `created_at` field to the
      # current date & time when you first create the record and it will also
      # set the updated_at to the same thing. ActiveRecord will also set the
      # `updated_at` to the current date & time when you change (update) the
      # record.
      t.timestamps
    end
  end
end
