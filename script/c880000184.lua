-- AUTO-GENERATED: OP01-061 / 카이도
-- rules_id=OP01-061 script_id=880000184 fingerprint=44937d8d1cad1e7c73a39677103f3387f7e0571df5f07d0ae47a78a39012949a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-061]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【자신의 턴 동안】【턴 1회】상대의 캐릭터가 KO 당했을 때, 두웅!! 덱에서 두웅!!을 1장까지 액티브로 추가한다.]],
        timings={
          [[ON_OPPONENT_CHARACTER_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-061]],
    schema_version=1,
  })
end
