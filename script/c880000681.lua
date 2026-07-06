-- AUTO-GENERATED: OP05-068 / 쵸파에몬
-- rules_id=OP05-068 script_id=880000681 fingerprint=9ac046bdf6996198d2bc3a346cf7b59521984df6092ea2a01d77897b61e7ae95
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                color=[[PURPLE]],
                power_lte=6000,
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=8,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신 필드에 두웅!!이 8장 이상인 경우, 자신의 파워 6000 이하이고 자색인 《밀짚모자 일당》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-068]],
    schema_version=1,
  })
end
