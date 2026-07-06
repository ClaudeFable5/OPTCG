-- AUTO-GENERATED: ST08-001 / 몽키 D. 루피
-- rules_id=ST08-001 script_id=880001834 fingerprint=2322239a945e7e198f59f2bb0427954ea314e7e81490105c910cd2554a092924
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST08-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】캐릭터가 KO 당했을 때, 이 리더에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ON_ANY_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST08-001]],
    schema_version=1,
  })
end
