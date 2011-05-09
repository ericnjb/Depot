# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Product.delete_all

Product.create(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language out there.  If you need to get working programs delivered fast, you should add Ruby to your toolbox.
      </p>},
  :image_url => '/images/ruby3.jpg',
  :price => 49.50)

Product.create(:title => 'The Adventures of Tom Sawyer',
  :description =>
    %{<p>
        Tom Sawyer is a classic of American writing.  Whlie Huck Finn may be the more highly regarded work, Tom Sawyer is unquestionably wider read.
      </p>},
  :image_url => '/images/tom_sawyer.jpg',
  :price => 35.99)
  
Product.create(:title => 'A Game of Thrones (A Song of Ice and Fire, Book 1)',
  :description =>
    %{<p>
        Readers of epic fantasy series are: (1) patient--they are left in suspense between each volume, (2) persistent--they reread or at least review the previous book(s) when a new installment comes out, (3) strong--these 700-page doorstoppers are heavy, and (4) mentally agile--they follow a host of characters through a myriad of subplots. In A Game of Thrones, the first book of a projected six, George R.R. Martin rewards readers with a vividly real world, well-drawn characters, complex but coherent plotting, and beautifully constructed prose, which Locus called "well above the norms of the genre."
        <p>
        Martin's Seven Kingdoms resemble England during the Wars of the Roses, with the Stark and Lannister families standing in for the Yorks and Lancasters. The story of these two families and their struggle to control the Iron Throne dominates the foreground; in the background is a huge, ancient wall marking the northern border, beyond which barbarians, ice vampires, and direwolves menace the south as years-long winter advances. Abroad, a dragon princess lives among horse nomads and dreams of fiery reconquest.
      </p>},
  :image_url => '/images/game_of_thrones.jpg',
  :price => 8.95)