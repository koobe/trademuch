package kgl

class Legacy {

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
    }
}
