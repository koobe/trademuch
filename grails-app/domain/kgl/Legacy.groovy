package kgl

class Legacy {

    def s3Service

    String bucket

    String key

    String s3key

    String metadata

    String title

    String description

    String opf

    String creator

    String contributor

    String date

    String language

    String subject

    String publisher

    String coverKey

    String imageItems

    Book book

    Date dateCreated
    Date lastUpdated

    static mapping = {
        opf type: 'text'
        imageItems type: 'text'

        //date column: '`date`'
        key column: '`key`'
    }

    static constraints = {
        description maxSize: 10 * 1024
        coverKey nullable: true
        imageItems nullable: true
        book nullable: true
    }

    URL getCoverUrl() {
        s3Service.getUrl(bucket, "${s3key}OEBPS/${coverKey}")
    }

    def makeBookObject() {
        book = new Book()
        book.name = title
        book.author = creator
        book.datePublish = date
        book.coverUrl = getCoverUrl().toString()
        book.save flush: true
    }
}
