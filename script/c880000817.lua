-- AUTO-GENERATED: OP06-083 / 오즈
-- rules_id=OP06-083 script_id=880000817 fingerprint=15c4f9d817694a7ca94decf07f0973ad352e27dd170505a9c47f7aae725d6ffb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[NEGATE_EFFECTS]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[KO_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                trait=[[스릴러 바크 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 《스릴러 바크 해적단》 특징을 가진 캐릭터 1장을 KO 시킬 수 있다: 이번 턴 동안, 이 캐릭터의 효과를 무효로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-083]],
    schema_version=1,
  })
end
