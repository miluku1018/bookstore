module BooksHelper
  def cover_image_tag(book, width: 800, height: 600, dummy_img: false)
      return generate_cover_image(book,width,height) if book.cover_image.attached?
      image_tag "https://fakeimg.pl/#{width}x#{height}/?text=hello" if dummy_img
  end
  
  private
  def generate_cover_image(book, width, height)
    image_tag book.cover_image.variant(resize_to_limit: "#{}"[width, height])
  end
end
