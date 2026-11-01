import { RulesPageLayout } from "@/components/rules-page-layout"
import { TeeingAreaSection } from "@/components/teeing-area-section"
import { SectionNavigation } from "@/components/section-navigation"

export default function TeeingAreaPage() {
  return (
    <RulesPageLayout title="Mesas de salida">
      <TeeingAreaSection />
      <SectionNavigation previous={{ href: "/dashboard/bases-y-dropear", label: "Bases y dropear" }} next={{ href: "/dashboard/area-general", label: "Área general" }} />
    </RulesPageLayout>
  )
}
