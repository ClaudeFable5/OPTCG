-- AUTO-GENERATED: ST13-001 / 사보
-- rules_id=ST13-001 script_id=880001900 fingerprint=7f32607fd1d33286c5d9f6208aafa58bc146363dbaaeb1725f5b4f3b2eb946a4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            faceup=true,
            op=[[ADD_OWN_CARD_TO_LIFE]],
            position=[[TOP]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                cost_gte=3,
                power_gte=7000,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【기동: 메인】【턴 1회】자신의 코스트 3 이상이고 파워 7000 이상인 캐릭터 1장을 자신의 라이프 맨 위에 앞면으로 더할 수 있다: 다음 자신의 턴 개시 시까지, 자신의 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-001]],
    schema_version=1,
  })
end
