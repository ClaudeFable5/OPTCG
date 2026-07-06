-- AUTO-GENERATED: ST12-007 / 리카
-- rules_id=ST12-007 script_id=880001889 fingerprint=5c20fc584abdf6634f74e919354a30810e0b0f296f3f95547257827c81137a6a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-007]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                attribute=[[SLASH]],
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[LIFE_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=2,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】2(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 상대의 라이프가 3장 이상인 경우, 자신의 코스트 4 이하인 <참격> 속성을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-007]],
    schema_version=1,
  })
end
