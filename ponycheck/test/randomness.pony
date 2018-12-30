use "ponytest"
use ".."
class GaussianPDFTest is UnitTest

  fun name(): String => "Randomness/gaussianPDF"

  fun apply(h: TestHelper) =>
    let pdf:F64 = GaussianPDF.gaussianPDFDenormalized(0.0)
    h.assert_eq[F64](pdf, 1.0)
    let pdf2:F64 = GaussianPDF.gaussianPDFDenormalized(2.0)
    h.assert_true((pdf2-0.135335)<0.001)
    let pdf3:F64 = GaussianPDF.gaussianPDFDenormalized(-0.8)
    h.assert_true((pdf2-0.72614)<0.001)

class GaussianPDFInvTest is UnitTest

  fun name(): String => "Randomness/gaussianPDFInv"

  fun apply(h: TestHelper) =>
    let pdf2:F64 = GaussianPDF.gaussianPDFDenormalizedInv(0.135335)
    h.assert_true((pdf2-2.0)<0.001)
    let pdf3:F64 = GaussianPDF.gaussianPDFDenormalizedInv(0.2755)
    h.assert_true((pdf2-1.6056)<0.001)